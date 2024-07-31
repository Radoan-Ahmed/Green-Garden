
class SaveListViewModel {
    int? id;
    String? index;

    SaveListViewModel({
        this.id,
        this.index,
        
    });

    factory SaveListViewModel.fromJson(Map<String, dynamic> json) => SaveListViewModel(
        id: json["id"],
        index: json["index"],
        
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "index" : index,
        
    };
}
