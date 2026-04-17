# Filter comprehensions work on ANY list of objects, not just graph queries.
# That composability is why [root()-->][?:Task] reads so cleanly.

obj Dog { has name: str, age: int; }
obj Cat { has name: str, age: int; }

with entry {
    pets: list[Dog | Cat] = [
        Dog(name="Rex", age=5),
        Cat(name="Whiskers", age=3),
        Dog(name="Buddy", age=2),
    ];

    # Filter by type.
    dogs = pets[?:Dog];
    print(f"Dogs: {dogs}");

    # Filter by field condition.
    young = pets[?age < 4];
    print(f"Young pets: {young}");

    # Combined: type + field.
    young_dogs = pets[?:Dog, age < 4];
    print(f"Young dogs: {young_dogs}");
}
