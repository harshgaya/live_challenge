class Music{
 final int? id;
 final String title;
 final String type;
 final int isFavorite;

 const Music({required this.isFavorite,required this.type, this.id,required this.title});
 factory Music.fromJson(Map<String,dynamic>json)=>Music(
   id: json['id'],
   title: json['title'],
   type: json['type'],
   isFavorite: json['isFavorite']
 );
 Map<String,dynamic> toJson()=>{
   'id':id,
   'title':title,
   'type':type,
   'isFavorite':isFavorite,
 };
}