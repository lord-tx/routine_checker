
/// The Routine Class houses the variables and functionality of all
/// Routine objects, this class core should only be added to and not
/// removed as some functionality might be in use.

// For the purpose of this test, all routines should expire after 15 minutes
const defaultExpiry = Duration(minutes: 15);

class Routine{
  Routine({
    required this.id,
    required this.title,
    required this.description,
    this.done = false
});

  // Basis Routine Information
  int? id;
  String? title;
  String? description;
  DateTime? frequency;
  DateTime? expiration;
  bool? done;

  // Basic Routine Functionality
  // Introduce chaining to reduce initialization complexity
  Routine editTitle(String newTitle){
    title = newTitle;
    return this;
  }

  Routine editDescription(String newDesc){
    description = newDesc;
    return this;
  }

  Routine setExpiration(){
    expiration = frequency?.add(defaultExpiry);
    return this;
  }

  // Boolean activation omitted from chaining
  void markDone() => done = true;
}