import React from 'react';
import  { useEffect, useState } from 'react';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';

function loadCSS(src) {
  return new Promise((resolve, reject) => {
    const link = document.createElement('link');
    link.rel = 'stylesheet';
    link.href = src;

    link.onload = () => resolve();
    link.onerror = () => reject(new Error(`Error loading CSS: ${src}`));

    document.head.appendChild(link);
  });
}

function HtmlPage({ src, css }) {
  const [cssLoaded, setCssLoaded] = useState(false);

  useEffect(() => {
    loadCSS(css)
      .then(() => setCssLoaded(true))
      .catch(error => console.error(error));
  }, [css]);

  if (!cssLoaded) {
    return null;
  }

  return (
    <iframe src="https://example.com" />
  );
}



function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<HtmlPage src="/public/index.html" css="/public/Casa.css" />} />
        <Route path="/Login" element={<HtmlPage src="/public/Pages/LoginForm.html" css="/public/Estilos/LoginForm.css" />} />
        <Route path="/Register" element={<HtmlPage src="/public/Pages/RegisterForm.html" css="/public/Estilos/RegisterForm.css" />} />
        <Route path="/Site" element={<HtmlPage src="/public/Pages/UserSite.html" css="/public/Estilos/UserSite.css" />} />
        <Route path="/Carga" element={<HtmlPage src="/public/Pages/carga.html" css="/public/Estilos/Carga.css" />} />
      </Routes>
    </Router>
  );
}


export default App;
