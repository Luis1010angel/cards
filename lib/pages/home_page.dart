import 'package:flutter/cupertino.dart'; 
import 'package:flutter/material.dart'; 
import 'package:flluter_aplication_widgets/providers/menu_provider.dart'; 
import 'package:flluter_aplication_widgets/utils/icono_string_util.dart'; 
class HomePage extends StatelessWidget { 
  @override 
Widget build(BuildContext context){ 
 return Scaffold( 
 appBar: AppBar( 
title: Text('Componetes Proyecto 1 Parcial'),  
), 
body: _lista(context), 
); 
} 

Widget _lista(BuildContext context) { 
 return FutureBuilder( 
future: menuProvider.cargarData(), 
initialData: [], 
builder:(context,AsyncSnapshot<List<dynamic>>snapshot){ 
return ListView( 
  children: _listaItems(snapshot.data, context),
); 
}, 
); 
} 
 List<Widget> _listaItems(List<dynamic>data,BuildContext context){ 
final List<Widget>opciones = []; 
data.forEach((opt){ 
final widgetTemp = ListTile( 
title:Text(opt['texto']), 
leading: getIcon(opt['icon']), 
trailing:Icon( 
Icons.keyboard_arrow_right_sharp, 
color:Colors.lightBlueAccent, 
), 
onTap:(){ 
//showDialog( 
//context:context, 
//builder:(BuildContext context)=> 
//builPopUpDialog(context, opt['texto']), 
//); 
//}, 
print(opt['ruta']);
        Navigator.of(context).pushNamed(opt['ruta']);
},
);
opciones..add(widgetTemp)..add(Divider()); 
}); 

return opciones; 

} 

Widget _builPopUpDialog(BuildContext context, String opt){ 
return new AlertDialog( 
title: const Text('Seleccionaste aqui'), 
content:new Column( 
mainAxisSize:MainAxisSize.min, 
children:<Widget>[ 
Text( opt+ ' - SELECCIONADA'), 
], 
), 

actions: <Widget>[ 
new FlatButton( 
onPressed:(){ 
Navigator.of(context).pop(); 
}, 
textColor:Theme.of(context).primaryColor, 
child:const Text('Cerrar'), 
), 
], 
); 
} 
} 