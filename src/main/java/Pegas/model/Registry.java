package Pegas.model;

import java.util.HashMap;
import java.util.Map;

public class Registry {
    private final Map<Integer, Animals> registry = new HashMap<>();

    public Map<Integer, Animals> loadRegistry(){
        return registry;
    }

    public void addAnimal(String name, int age, String commands, TypeOfAnimal type){
        Animals animal = switch (type) {
            case CAT -> new Cat(name, age, commands);
            case DOG -> new Dog(name, age, commands);
            case HUMSTER -> new Humster(name, age, commands);
            case HORSE -> new Horse (name, age, commands);
            case CAMEL -> new Camel (name, age, commands);
            case DONKEY -> new Donkey (name, age, commands);
        };
        registry.put(animal.getId(), animal);
    }
}
