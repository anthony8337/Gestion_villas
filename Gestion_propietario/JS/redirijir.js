function redirigir() {
    
    window.location.href = "usuario.php";
  }

  function redirigir_sistema() {
    var admin = "abierto";
    sessionStorage.setItem("admin",admin)
    window.location.href = "principal.php";
  }

  function redirigir_login() {
    window.location.href = "index.php";
  }