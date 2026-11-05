-- Moity Scents: tabla de perfumes y carpeta de fotos en Supabase.
-- Pegar en Supabase > SQL Editor > Run.
create table if not exists perfumes (
  id text primary key,
  brand text not null,
  name text not null,
  type text not null check (type in ('disenador','arabe')),
  p5 integer not null,
  p10 integer not null,
  img text default '',
  sold_out boolean default false,
  sort integer default 0
);
alter table perfumes enable row level security;
grant select on perfumes to anon, authenticated;
grant insert, update, delete on perfumes to authenticated;
create policy "todos pueden ver el menu" on perfumes for select using (true);
create policy "solo el dueno edita" on perfumes for all to authenticated using (true) with check (true);

insert into storage.buckets (id, name, public) values ('fotos','fotos',true) on conflict do nothing;
create policy "fotos publicas" on storage.objects for select using (bucket_id = 'fotos');
create policy "dueno sube fotos" on storage.objects for insert to authenticated with check (bucket_id = 'fotos');
create policy "dueno cambia fotos" on storage.objects for update to authenticated using (bucket_id = 'fotos');

insert into perfumes (id,brand,name,type,p5,p10,img,sold_out,sort) values
 ('swy','Emporio Armani','Stronger With You Intensely','disenador',220,380,'img/p07.jpeg',false,1),
 ('lme','Jean Paul Gaultier','Le Male Elixir','disenador',220,380,'img/p04.jpeg',false,2),
 ('lbe','Jean Paul Gaultier','Le Beau EDT','disenador',180,300,'img/p05.jpeg',true,3),
 ('lbp','Jean Paul Gaultier','Le Beau Le Parfum','disenador',220,380,'img/p01.jpeg',false,4),
 ('bcf','Valentino','Uomo Born in Roma Coral Fantasy','disenador',220,400,'img/p06.jpeg',false,5),
 ('bedt','Valentino','Uomo Born in Roma EDT','disenador',220,400,'img/p08.jpeg',false,6),
 ('bint','Valentino','Uomo Born in Roma Intense','disenador',230,420,'img/p02.jpeg',false,7),
 ('hawas','Rasasi','Hawas Ice','arabe',130,220,'img/p03.jpeg',false,8),
 ('vulcan','French Avenue','Vulcan Feu','arabe',150,250,'',false,9),
 ('bking','Bharara','Bharara King','arabe',150,250,'',false,10),
 ('vradio','Lattafa','Vintage Radio','arabe',120,230,'',false,11)
on conflict (id) do nothing;
