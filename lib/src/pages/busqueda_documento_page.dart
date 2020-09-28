import 'package:flutter/material.dart';
import 'package:infoveapp/src/pages/consulta_documento_screen.dart';
import 'package:infoveapp/src/pages/networking.dart';
import 'package:infoveapp/src/models/usuario_model.dart';
import 'package:infoveapp/src/utils/utils.dart' as utils;
import 'package:provider/provider.dart';
import '../login_state.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DocumentoPage extends StatefulWidget {

  @override
  _DocumentoPageState createState() => _DocumentoPageState();
}

class _DocumentoPageState extends State<DocumentoPage> {
  final Usuario usuario = new Usuario();
  final formKey = GlobalKey<FormState>();
  String cedula;

  @override
  void initState() {
    super.initState();
    getDataWeb();
  }

  void getDataWeb() async{

   cedula = usuario.cedula;

    NetworkHelper networkHelper = NetworkHelper('https://infoappve.azurewebsites.net/Servicios/GetDocumento?id=79488667');

    var decodeData = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return ConsultaDocumentoScreen(
        consultaDocumento: decodeData,
      );
    }));
  }

  @override
  //var documento = Provider.of<Usuario>(context).cedula;
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
        appBar: AppBar(title: Text('Búsqueda por documento'),
          leading: IconButton(
            tooltip: 'Atrás',
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, 'menu'),
          ),),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(15.0),
              child: Form(
                  key: formKey,
                  child: Column(children: <Widget>[

                    SizedBox(height: 30.0),
                    _documento(),
                    SizedBox(height: 30.0),
                    _boton(),
                    SizedBox(height: 120.0),
                    Center(
                      child: SpinKitDoubleBounce(
                        color: Color(0xFF2172af),
                        size: 100.0,
                      ),
                    ),
                    SizedBox(height: 200.0),
                    Container(
                      width: 180,
                      child: RaisedButton.icon(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                          elevation: 10.0,
                          padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                          color: Color(0xFF2172af),
                          textColor: Colors.white,
                          label: Text('Cerrar sesión', style: TextStyle(fontSize: 14, color: Colors.white),),
                          icon: Icon(Icons.settings_power),
                          onPressed: () {Provider.of<LoginState>(context).logout();
                          Navigator.of(context).pop();}),
                    ),
                  ]))),
        )
    );
  }

  Widget _documento() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          icon: Icon(Icons.perm_identity, color: Color(0xFF2172af),),
          hintText: 'Ingrese el número de documento',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))),
      //initialValue: usuario.cedula,
      onSaved: (value) => usuario.cedula,
      validator: (value) {
        if (utils.isNumeric(value)) {
          return usuario.cedula;
        } else {
          return 'Ingrese un documento válido sin puntos ni comas';
        }
      },
    );
  }

  Widget _boton() {
    return RaisedButton.icon(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        elevation: 10.0,
        padding: EdgeInsets.symmetric(horizontal: 70.0, vertical: 12.0),
        color: Color(0xFF2172af),
        textColor: Colors.white,
        label: Text('Buscar', style: TextStyle(fontSize: 18, color: Colors.white),),
        icon: Icon(Icons.search),
        onPressed: () {_submit();});
  }

  void _submit() async {
    if (!formKey.currentState.validate()) return;
    formKey.currentState.save();
    print(usuario.cedula);
    print("requesting..");
    getDataWeb();
  }
}