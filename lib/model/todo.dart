class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Exercícios matinais', isDone: true),
      ToDo(id: '02', todoText: 'Ir ao mercado', isDone: true),
      ToDo(id: '03', todoText: 'Checar e-mails'),
      ToDo(id: '04', todoText: 'Reunião com o time de desenvolvimento'),
      ToDo(id: '05', todoText: 'Ligar para o cliente'),
      ToDo(id: '06', todoText: 'Jantar com a família'),
    ];
  }
}
