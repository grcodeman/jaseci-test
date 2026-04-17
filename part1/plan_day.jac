# Try It Yourself: plan_day takes a list of task names and an hour,
# returns a formatted string using check_time for the greeting.

def check_time(hour: int) -> str {
    if hour < 12 {
        return "Good morning!";
    } elif hour < 17 {
        return "Good afternoon!";
    } else {
        return "Good evening!";
    }
}

def plan_day(tasks: list[str], hour: int) -> str {
    greeting = check_time(hour);
    task_list = "";
    for i in range(len(tasks)) {
        if i == 0 {
            task_list = tasks[i];
        } else {
            task_list = f"{task_list}, {tasks[i]}";
        }
    }
    return f"{greeting} Today's tasks: {task_list}";
}

with entry {
    print(plan_day(["Buy groceries", "Go running"], 9));
    print(plan_day(["Team standup", "Review PRs", "Cook dinner"], 14));
    print(plan_day(["Read a book"], 20));
}
