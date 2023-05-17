import 'package:flutter/material.dart';
import 'package:womam_shop/constants.dart';
import 'package:womam_shop/model/product.dart';

class BodyDetails extends StatefulWidget {
  const BodyDetails({super.key, required this.product});
  final Product product;
  @override
  State<BodyDetails> createState() => _BodyDetailsState();
}

class _BodyDetailsState extends State<BodyDetails> {
  int numberItens=1;
  void addItens(){
    setState(() {
      this.numberItens+=1;
    });
  }
  void removeItens(){
    setState(() {
      if(this.numberItens>1){
        this.numberItens-=1;
      }  
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //It provide total height and width
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24)    
                      )
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: bodyMain(context),
                      ),
                    ],
                  ),
                ),
                productTitleImage(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column bodyMain(BuildContext context) {
    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Color",
                                    style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Row(
                                    children: [
                                      colorChooseType(color:widget.product.color),
                                      colorChooseType(color:Color.fromARGB(66, 15, 8, 33)),
                                      colorChooseType(color:Color.fromARGB(66, 25, 224, 91)),
                                      colorChooseType(color:Color.fromARGB(66, 230, 217, 35)),
                                    ],
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: "Size\n",
                                      style: TextStyle(
                                        fontSize: 18, 
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                      ),
                                    ),
                                    TextSpan(
                                      text:"${widget.product.size}",
                                      style: Theme.of(context).textTheme.headline5 
                                    )
                                  ]
                                ),
                              
                              )
                            ],
                          ),
                          const Flexible(
                            child:  Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                height: 1.5
                              ),
                              textAlign: TextAlign.justify,
                            )  
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cartCounterState(),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 239, 235, 235),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                          buttonBuy()
                        ],
                      );
  }

  Row buttonBuy() {
    return Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: widget.product.color,
                                  ),
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                child: Icon(
                                  Icons.shopify,
                                  color:  widget.product.color,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  height: 48,
                              
                                  child: TextButton(
                                    onPressed: () {}, 
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                        widget.product.color
                                      ), 
                                      shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                        )
                                      )     
                                    ),
                                    child: const Text(
                                      "COMPRAR AGORA",
                                      style: TextStyle(
                                        color: Colors.white
                                      ),
                                    )
                                  ),
                                ),
                              )
                            ],
                          );
  }

  Padding cartCounterState({IconData? icon, Function? press}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 18
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 32,
            child: buttonAdd(
              icon: Icons.remove,
              press: removeItens
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10
            ),
            child: Text(
              "$numberItens",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(
            width: 40,
            height: 32,
            child: buttonAdd(
              icon: Icons.add,
              press: addItens
            ),
          ),
        ],
      ),
    );
  }

  OutlinedButton buttonAdd({IconData? icon=Icons.remove, Function? press}) {
    return OutlinedButton(
          style: ButtonStyle(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.zero
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13)
              )
            ),
          ),
          onPressed: () => press!(), 
          child: Icon(
            icon,
            color: Colors.grey,
          )
        );
  }

  Column colorChooseType({Color  color=Colors.black12}) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
          height: 24,
          width: 24,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: color)),
          child:  DecoratedBox(
            decoration:
                BoxDecoration(color: color, shape: BoxShape.circle),
          ),
        ),
      ],
    );
  }

  Padding productTitleImage(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kDefaultPaddin, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pastas das poderosas",
            style: TextStyle(color: Colors.white),
          ),
          Text(widget.product.title,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Colors.white
                )
          ),
          const SizedBox(
            height: kDefaultPaddin,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(children: [
                  const TextSpan(text: "Preço\n"),
                  TextSpan(
                    text: "AOA ${widget.product.price}",
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              const SizedBox(
                width: kDefaultPaddin,
              ),
              Expanded(
                child: Hero(
                  tag: "${widget.product.id}",
                  child: Image.asset(
                    widget.product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
