class Constants{

  //App
    static const String createMessage = "Creación exitosa";
  static const String appName = "Subsidio Estudiantil"; 
  static const String estudiante = "Estudiantes";
  static const String registro = "Registro"; 
  static const String actualizar = "Actualizar Estudiante"; 
  static const String buscarEstudiante = "Buscar Estudiante"; 
  //Url
  static const String urlAuthority = "backendcolegio.herokuapp.com";
  static const String contenTypeHeader = "application/json";
  static const String pathServiceLogin = "/login";
  static const String pathServiceInsertEstudiante = "/saveEstudiante";
  static const String pathServiceListEstudiante = "/findAllEstudiantes";
  static const String pathServicefindEstudiante = "/findEstudiante/:documento";
  //Botones
  static const String btnCerrar = "Cerrar";
  static const String btnIngresar = "Ingresar";
  static const String btnRegistrar = "Registrar ";
  static const String btnModificar = "Editar ";
  static const String btnEliminar = "Eliminar ";
  static const String btnBuscar = "Buscar ";
  //labels
  static const String labelPassword ="Contraseña";
  static const String labelUsuario ="Correo";
  static const String labelNombre ="Nombre";
  static const String labelApellido ="Apellido";
  static const String labelDocumento ="Identificación";
  static const String labelGrado ="Grado";
  static const String labelBarrio ="Barrio";
  static const String labelEstrato ="Estrato";
  //Validaciones field_empty
  static const String field_empty ="El campo esta vacío";
  static const String patternNombre = r'(^[a-zA-Z ]*$)';
  static const String nameStructure = "El campo solo puede contener a-z y A-Z";
  static const String patterNumero = r'(^[0-9]*$)';
    static const String estructura = "La estructura no coincide con la solicitada";
    static const String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  //Rutas
  static const String homeRoute = "/";
  static const String menuRoute = "/home";
  static const String registroEstudianteRoute = "/registro_estudiantes";
  static const String listaEstudianteRoute = "/lista_estudiantes";
  static const String buscarEstudianteRoute = "/buscar_estudiantes";
  //Mensajes
  static const String registroExitoso = "¡Registro exitoso!";
  static const String tittleDialog = "Información";
  static const String actualizacion = "  ¡Actualizado!";
  //Ruter imagenes
  static const String loginImage = 'assets/imgLogin.png';
  static const String loginImage2 = 'https://images.vexels.com/media/users/3/144301/isolated/preview/7e0537f2c49080eb77ac68a02f3a0cef-bandera-de-colombia-by-vexels.png';
  static const String mensajeInicial = 'Es una ayuda económica que se le da a los estudiantes de los estratos 1 y 2 del colegio San Juan de Dios, se entregán mensual por medio de la plataforma de pagos Efecty';
}