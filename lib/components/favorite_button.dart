import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FavoriteButton extends StatefulWidget{


  bool favorite;

  FavoriteButton({super.key,required this.favorite});



  @override
  State<FavoriteButton>createState() =>_FavoriteButtonState(favorite);


}


class _FavoriteButtonState extends State<FavoriteButton>{

  bool _favorite= false;

  _FavoriteButtonState(bool favorite){
    _favorite = favorite;
  }

  @override
  Widget build(BuildContext context){
    return(IconButton(

      icon: _favorite?
      SvgPicture.asset("assets/icons/favoriteFull.svg")
      :SvgPicture.asset("assets/icons/favoriteEmpty.svg"),
      onPressed: toggleFavorite,
    ));


  }


  void toggleFavorite(){
    setState(() {
      _favorite = !_favorite;
    });


  }


}