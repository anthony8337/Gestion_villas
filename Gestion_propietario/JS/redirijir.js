function redirigir() {
    
    window.location.href = "usuario.php";
  }

  function redirigir_sistema() {
    window.location.href = "principal.php";
  }

  function redirigir_sistema_admin() {
    window.location.href = "regirigr_p_admin.php";
  }

  function redirigir_login() 
  {
    sessionStorage.clear();
    window.location.href = "index.php";
  }