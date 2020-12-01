import 'package:delivery_app/common/utils/app_colors.dart';
import 'package:delivery_app/features/subcategory/subcategory_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDescriptionPage extends StatefulWidget {
  ItemModel model;

  ItemDescriptionPage({this.model});

  @override
  _ItemDescriptionPageState createState() => _ItemDescriptionPageState();
}

class _ItemDescriptionPageState extends State<ItemDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [_pageView(context: context), _contentWidget(context: context)],
    ));
  }

  _pageView({BuildContext context}) {
    double height = 400;

    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: height,
        width: double.infinity,
        child: PageView(
          physics: ClampingScrollPhysics(),
          children: [
            Container(
                height: height,
                width: double.infinity,
                child: Image.asset(
                  "images/item_page_view.png",
                  fit: BoxFit.cover,
                )),
            Container(
                height: height,
                width: double.infinity,
                child: Image.asset(
                  "images/media.png",
                  fit: BoxFit.cover,
                )),
          ],
        ),
      ),
    );
  }

  _contentWidget({BuildContext context}) {
    var buttonWidth = MediaQuery.of(context).size.width - 40 - 21 - 50;

    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          decoration: BoxDecoration(
              color: AppColors.defaultBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(widget.model.title,
                  style: TextStyle(
                      fontSize: 26,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  _createText(
                      data: "${widget.model.price}",
                      size: SubCategoryTextSize.large),
                  SizedBox(
                    width: 2,
                  ),
                  _createText(
                      data: "${widget.model.currency} / ${widget.model.unit}",
                      size: SubCategoryTextSize.medium),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(widget.model.extraInformation,
                  style: TextStyle(
                      fontSize: 17,
                      color: AppColors.primaryButtonColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 32,
              ),
              Text(widget.model.originalCountry,
                  style: TextStyle(
                      fontSize: 22,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 16,
              ),
              Text(widget.model.fullDescription,
                  style: TextStyle(
                      fontSize: 17, color: AppColors.secondaryTextColor)),
              SizedBox(
                height: 56,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: CupertinoButton(
                        onPressed: () {
                          setState(() {
                            widget.model.isFavorite = !widget.model.isFavorite;
                          });
                        },
                        child: Icon(
                            widget.model.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: 10,
                            color: widget.model.isFavorite
                                ? Colors.red
                                : AppColors.secondaryTextColor)),
                  ),
                  Container(
                    width: buttonWidth,
                    child: CupertinoButton(
                      onPressed: () {
                        // _showAndroidAddToCartDialog();
                        _showiOSAddToCartDialog();
                      },
                      child: createButtonText(
                          data: "ADD TO CART", color: Colors.white),
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 65,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text createButtonText({String data, Color color}) {
    var textStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color);
    return Text(data, style: textStyle);
  }

  _createText({String data, SubCategoryTextSize size}) {
    TextStyle style;

    switch (size) {
      case SubCategoryTextSize.medium:
        style = TextStyle(
            fontSize: 24,
            color: AppColors.secondaryTextColor,
            fontWeight: FontWeight.w500);
        break;
      case SubCategoryTextSize.large:
        style = TextStyle(
            fontSize: 32,
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.bold);
        break;
      default:
        break;
    }

    return Text(data, style: style);
  }

  Future<void> _showAndroidAddToCartDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text("The item was added to the cart!!!"),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _showiOSAddToCartDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text("Success"),
          content: Text("The item was added to the cart!!!"),
          actions: [
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}
