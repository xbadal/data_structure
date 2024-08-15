void main(List<String> arguments) {
  LinkedList linkedList = LinkedList();

  linkedList.addFirst("5");
  linkedList.addFirst("4");
  linkedList.addFirst("3");
  linkedList.addFirst("2");
  linkedList.addFirst("1");
  // linkedList.deleteFirst();
  linkedList.printList();
  print("Hello");
  linkedList.reverse();
  linkedList.printList();
}

class LinkedList {
  int size = 0;
  Node? head;

  // Add Item at the start of the list
  void addFirst(dynamic value) {
    Node newNode = Node(value);

    size++;
    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
    size++;
  }

  void addLast(dynamic value) {
    Node newNode = Node(value);

    if (head != null) {
      Node currentNode = head!;

      while (currentNode.next != null) {
        currentNode = currentNode.next!;
      }
      currentNode.next = newNode;
    } else {
      head = newNode;
    }
    size++;
  }

  void deleteFirst() {
    if (head == null) {
      print('List is empty');
      return;
    } else {
      size--;
      Node? currentNode = head;
      if (currentNode!.next == null) {
        head = null;
      } else {
        Node? nextNode = head!.next;
        head = nextNode;
      }
    }
  }

  void deleteLast() {
    if (head == null) {
      print('List is empty');
      return;
    }
    size--;
    if (head!.next == null) {
      head = null;
    } else {
      Node? secondLast = head;
      Node? lastNode = head!.next;

      while (lastNode!.next != null) {
        secondLast = secondLast!.next;
        lastNode = lastNode.next;
      }
      secondLast!.next = null;
    }
  }

  int getSize() {
    return size;
  }

  void reverse() {
    if (head == null) {
      print("List is empty");
    } else if (head!.next == null) {
      printList();
    } else {
      Node? previousNode = head;
      Node? currentNode = head!.next;
      Node? nextNode;
      while (currentNode != null) {
        nextNode = currentNode.next;
        currentNode.next = previousNode;
        // Reverse
        previousNode = currentNode;
        currentNode = nextNode;
      }
      head!.next = null;
      head = previousNode;
    }
  }

  void printList() {
    if (head != null) {
      Node? currentNode = head;
      while (currentNode != null) {
        print(currentNode.value);
        currentNode = currentNode.next;
      }
    } else {
      print("List is empty");
    }
  }
}

class Node {
  dynamic value;
  Node? next;

  Node(this.value);
}
