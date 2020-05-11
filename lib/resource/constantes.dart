class Constants{

  //App
  static const String createMessage = "Creación exitosa";
  static const String appName = "Subsidio Estudiantil"; 
  static const String estudiante = "Estudiantes";
  static const String registro = "Registro de Estudiante"; 
  static const String registroSubsidio = "Registro de Subsidio"; 
  static const String registroReporte = "Registro de Reporte";
  static const String eliminarReporte = "Eliminar Reporte"; 
  static const String actualizarReporte = "Actualizar Reporte"; 
  static const String actualizar = "Actualizar Estudiante"; 
  static const String eliminarEstudiante = "Eliminar Estudiante"; 
  static const String eliminarSubsidio = "Eliminar Subsidio"; 
  static const String buscarSubsidio = "Consultar Subsidio"; 
  static const String reporteConsulta = "Reporte de Consultas"; 
  static const String reporteSubsidio = "Reporte de Subsidios";
  static const String listareporte = "Lista de Reportes";
  static const String listaSubsidio = "Lista de Subsidios";
  static const String listaEstudiantes = "Lista de Estudiantes";
  static const String grafico = "Grafico de reporte"; 
  //Url
  static const String urlAuthority = "backendcolegio.herokuapp.com";
  static const String urlAu= "https://backendcolegio.herokuapp.com";
  static const String contenTypeHeader = "application/json";
  static const String pathServiceLogin = "/login";
  static const String pathServiceInsertEstudiante = "/saveEstudiante";
  static const String pathServiceListEstudiante = "/findAllEstudiantes";
  static const String pathServicefindEstudiante = "/findEstudiante/";
  static const String pathServiceDeleteEstudiante = "/deleteEstudiante/";
  static const String pathServiceInsertSubsidio = "/saveSubsidio";
  static const String pathServiceListSubsidio = "/findAllSubsidios";
  static const String pathServiceDeleteSubsidio = "/deleteSubsidio/";
  static const String pathServiceBuscarSubsidio = "/findSubsidio/";
  static const String pathServiceInsertReporte = "/saveReporte";
  static const String pathServiceListReporte = "/findAllReportes";
  static const String pathServiceDeleteReporte = "/deleteReporte/";
  //Botones
  static const String btnCerrar = "Cerrar";
  static const String btnIngresar = "Ingresar";
  static const String btnRegistrar = "Registrar ";
  static const String btnModificar = "Editar ";
  static const String btnEliminar = "Eliminar ";
  static const String btnBuscar = "Buscar ";
  static const String btnConsultar = "Consultar ";
  //labels
  static const String labelPassword ="Contraseña";
  static const String labelUsuario ="Correo";
  static const String labelNombre ="Nombre";
  static const String labelApellido ="Apellido";
  static const String labelDocumento ="Identificación";
  static const String labelEstudiante ="Estudiante";
  static const String labelGrado ="Grado";
  static const String labelBarrio ="Barrio";
  static const String labelSubsidio ="Subsidio";
  static const String labelEstrato ="Estrato";
  static const String labelDescripcion ="Descripcion";
  static const String labelENumeroSubsidio ="Numero de Subsidio";
  static const String labelValor ="Valor Subsidio";
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
  static const String registroSubsidioRoute = "/registro_subsidio";
  static const String listaSubsidioRoute = "/lista_subsidio";
  static const String eliminarSubsidioRoute = "/eliminar_subisidio";
  static const String buscarEstudianteRoute = "/buscar_estudiantes";
  static const String registroReporteRoute = "/registro_reporte";
  static const String listaReporteRoute = "/lista_reporte";
  static const String eliminarReporteRoute = "/eliminar_reporte";
  static const String graficoRoute = "/grafico";
  static const String homeEstudianteRoute = "/home_estudiante";
  static const String consultaDeEstudianteRoute = "/consulta_subsidio";
  //Mensajes
  static const String registroExitoso = "¡Registro exitoso!";
  static const String tittleDialog = "Información";
  static const String actualizacion = "  ¡Actualizado!";
  static const String eliminado = "  ¡Eliminado!";
  //Ruter imagenes
  static const String loginImage = 'assets/imgLogin.png';
  static const String loginImage2 = 'https://images.vexels.com/media/users/3/144301/isolated/preview/7e0537f2c49080eb77ac68a02f3a0cef-bandera-de-colombia-by-vexels.png';
  static const String mensajeInicial = 'Es una ayuda económica que se le da a los estudiantes de los estratos 1 y 2 del colegio San Juan de Dios, se entregán mensual.';
}