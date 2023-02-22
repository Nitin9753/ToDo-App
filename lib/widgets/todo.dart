class ToDo{
  final int count=0;
  final String id;
  final String content;
  bool isDone;
  ToDo({required this.id,required this.content, this.isDone=false});
  static List<ToDo> todoList(){
    List<ToDo> m=[];
    for(int i=0;i<0;i++){
      ToDo element=ToDo(id: '${i+1}', content: (i+100).toString());
      m.add(element);
    }
    return m;
  }

}