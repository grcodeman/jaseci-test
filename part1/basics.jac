# Variables, types, f-strings, comments
#* Block comment:
   this file covers the Part 1 basics in one place. *#

def greet(name: str) -> str {
    return f"Good morning, {name}! Let's plan your day.";
}

def add(a: int, b: int) -> int {
    return a + b;
}

def check_time(hour: int) -> str {
    if hour < 12 {
        return "Good morning!";
    } elif hour < 17 {
        return "Good afternoon!";
    } else {
        return "Good evening!";
    }
}

def categorize(fruit: str) -> str {
    switch fruit {
        case "apple":
            return "pome";
        case "banana" | "plantain":
            return "berry";
        default:
            return "unknown";
    }
}

def describe(value: int) -> str {
    match value {
        case 0:
            return "zero";
        case 1 | 2 | 3:
            return "small number";
        case other:
            return "something else";
    }
}

obj Animal {
    has name: str,
        sound: str;

    def speak -> str {
        return f"{self.name} says {self.sound}!";
    }
}

with entry {
    name: str = "My Day Planner";
    version: int = 1;
    rating: float = 4.5;
    ready: bool = True;

    greeting = f"Welcome to {name} v{version} (rating {rating}, ready={ready})";
    print(greeting);

    print(greet("Alice"));
    print(add(2, 3));

    tasks = ["Buy groceries", "Team standup", "Go running"];
    for task in tasks {
        print(f"- {task}");
    }

    for i in range(3) {
        print(i);
    }

    count = 3;
    while count > 0 {
        print(f"Countdown: {count}");
        count -= 1;
    }

    hour = 10;
    mood = "energized" if hour < 12 else "tired";
    print(mood);

    print(check_time(9));
    print(check_time(14));
    print(check_time(20));

    print(categorize("apple"));
    print(categorize("banana"));
    print(categorize("kiwi"));

    print(describe(0));
    print(describe(2));
    print(describe(42));

    dog = Animal(name="Rex", sound="Woof");
    print(dog.speak());
}
