# Página web de Moity Scents

- `index.html` es toda la página. El menú público se abre normal; el panel privado está en `tu-sitio.com/#panel`.
- `img/` tiene el logo y las fotos de los perfumes.
- Ahora mismo está en **modo prueba**: lo que cambies en el panel se guarda solo en ese navegador.

## Para que el panel cambie el menú de todos (base de datos)
1. Crear proyecto gratis en supabase.com.
2. SQL Editor → pegar `supabase-setup.sql` → Run.
3. Authentication → Users → Add user (tu correo y contraseña para entrar al panel). Desactivar "Allow new users to sign up".
4. Project Settings → API: copiar "Project URL" y "anon public key" y ponerlos en `index.html`, en `window.MOITY_CONFIG`.

## Publicar
Subir esta carpeta completa a Netlify, Vercel, GitHub Pages o cualquier hosting de páginas estáticas.
