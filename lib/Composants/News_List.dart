import 'package:airbus_app/blocs/news/news_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:airbus_app/models/user.dart';
import 'package:airbus_app/constantes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class NewsView extends StatelessWidget {
     News newss ;

  NewsView({
      required this.newss
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: newss.title,
          child: Material(
            child: InkWell(
              onTap: () {
               // Navigator.push(context, MaterialPageRoute<ProduitDetail>(builder: (_)=>
                 //   MultiBlocProvider(providers: [BlocProvider.value(value: BlocProvider.of<ProduitBloc>(context)),
                    //  BlocProvider.value(value: BlocProvider.of<PanierBloc>(context))], child: ProduitDetail(produit: produit,))));
              },
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        newss.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                       newss.title.toString(),
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "TND"+newss.context,
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            ),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    "images/plane.png",
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
