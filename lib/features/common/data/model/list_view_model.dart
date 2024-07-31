
class ListViewModel {
    int? id;
    String? title;
    String? image;
    String? imageType;
    String? time;

    ListViewModel({
        this.id,
        this.title,
        this.image,
        this.imageType,
        this.time,
    });

    factory ListViewModel.fromJson(Map<String, dynamic> json) => ListViewModel(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        imageType: json["imageType"],
        time: json["time"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "imageType": imageType,
        "time" : time,
    };
}
