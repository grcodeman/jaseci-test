# Try It Yourself (Part 2): create three tasks, mark one done,
# then use [?:Task, done == False] to list only the pending ones.
#
# This file cleans up existing Tasks on entry so it stays idempotent
# across runs — otherwise persistence would duplicate tasks each time.

node Task {
    has title: str,
        done: bool = False;
}

with entry {
    # Reset: remove any Task nodes from previous runs.
    for t in [root()-->][?:Task] {
        del t;
    }

    # Create three tasks.
    root() ++> Task(title="Buy groceries");
    root() ++> Task(title="Go running");
    root() ++> Task(title="Read a book");

    # Mark one as done.
    for t in [root()-->][?:Task] {
        if t.title == "Go running" {
            t.done = True;
        }
    }

    # Filter: only pending tasks.
    # Note: filter comprehensions take comparison expressions, not `not x`,
    # so `done == False` is the right form here despite the W2075 lint warning.
    pending = [root()-->][?:Task, done == False];
    print(f"{len(pending)} pending task(s):");
    for t in pending {
        print(f"  - {t.title}");
    }
}
