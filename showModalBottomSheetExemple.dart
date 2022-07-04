class showModalBottomSheetExemple{

// Exemplo de lista que é passada por parametro no metodo
  List<String> lstTeste = [
                          'Item 1',
                          'Item 2',
                          'Item 3',
                          'Item 4',
                          'Item 5',
                          'Item 6',
                          'Item 7',
                          'Item 8',
                          'Item 9',
                          'Item 10',
                          'Item 11',
                        ];

// Variavel do item selecionado
  static int selectedCarId = -1; //Variavel estática que to usando no ModalFromBottom pq tava retornando nulo do metodo

  static Future<int> modalFromBottom(BuildContext context, List<String> lista) async {

    ScrollController scrollSheetController = ScrollController();
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    await showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(18),
            topLeft: Radius.circular(18)
        ),
      ),
      isScrollControlled: false,
      isDismissible: true,
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (BuildContext context, StateSetter setStateLocal) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18),
                topLeft: Radius.circular(18)
            ),
            color: Colors.white,
          ),
          child: Container(
            height: height * 0.6,
            child: Column(
              children: [

                Container(
                  width: 100,
                  height: 4,
                  margin: EdgeInsets.only(
                      top: 20,
                      bottom: 15
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(6),

                  ),
                ),

                Text('Selecione uma opção'),

                SizedBox(
                  height: 5,
                ),

                Container(
                  height: height * 0.6 - 98,
                  child: RawScrollbar(
                    controller: scrollSheetController,
                    thickness: 5,
                    radius: Radius.circular(10),
                    trackVisibility: true,
                    thumbVisibility: true,
                    thumbColor: Colors.grey.shade400,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: ClampingScrollPhysics(),
                      controller: scrollSheetController,
                      itemCount: lista.length,
                      itemBuilder: (BuildContext context, int index) {
                        final itemLista = lista[index];
                        return InkWell(
                          onTap: () {
                            setStateLocal((){
                              selectedCarId = lista.indexOf(itemLista);
                              Navigator.pop(context);
                            });
                          },
                          child: Container(
                            width: width,
                            height: 70,
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(
                                left: 15,
                                right: 15,
                                // top: 10,
                                // bottom: 10
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Text(
                              itemLista,
                              maxLines: 3,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black87,
                                  fontSize: 14
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );

  }

}
