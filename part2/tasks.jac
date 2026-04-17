# node = persistent data type that lives in the graph.
# Anything connected to root persists across runs (stored in .jac/data/).
# Re-run this file and you will see duplicates accumulate — that is the
# persistence model working. To reset: rm -rf part2/.jac/

node Task {
    has title: str,
        done: bool = False;
}

with entry {
    # ++> creates a node and connects it to root with an edge.
    root() ++> Task(title="Buy groceries");
    root() ++> Task(title="Team standup at 10am");
    root() ++> Task(title="Go for a run");

    # Capture the new node — ++> returns a list with the created node.
    result = root() ++> Task(title="Read a book");
    book = result[0];
    print(f"Created: {book.title} (jid={jid(book)})");

    # Query all Task nodes connected to root.
    tasks = [root()-->][?:Task];
    print(f"{len(tasks)} task(s) in graph:");
    for t in tasks {
        status = "done" if t.done else "pending";
        print(f"  [{status}] {t.title}");
    }

    # Filter by field value.
    grocery = [root()-->][?:Task, title == "Buy groceries"];
    print(f"Grocery matches: {len(grocery)}");

    # Delete a node with del.
    for t in [root()-->][?:Task] {
        if t.title == "Team standup at 10am" {
            del t;
        }
    }
    print(f"After delete: {len([root()-->][?:Task])} task(s)");
}
