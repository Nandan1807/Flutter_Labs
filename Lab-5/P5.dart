class Friend {
  String name;
  String phone;
  String email;

  Friend({required this.name, required this.phone, required this.email});
}

void main() {
  Map<String, Friend> friends = {
    "Alice": Friend(name: "Alice", phone: "123-456-7890", email: "alice@example.com"),
    "Bob": Friend(name: "Bob", phone: "987-654-3210", email: "bob@example.com"),
    "Charlie": Friend(name: "Charlie", phone: "555-666-7777", email: "charlie@example.com"),
  };

  String searchName = "Bob";
  if (friends.containsKey(searchName)) {
    Friend friend = friends[searchName]!;
    print("Name: ${friend.name}, Phone: ${friend.phone}, Email: ${friend.email}");
  } else {
    print("Friend not found.");
  }
}
