package Pegas.presenter;

import Pegas.model.Animals;
import Pegas.model.TypeOfAnimal;

import java.util.Map;
import java.util.Optional;

public interface Model {
    int addAnimal(String name, int age, String commands, TypeOfAnimal type);
    Map<Integer, Animals> loadRegistry();
    Optional<Animals> findAnimal(int id);
    void addNewCommands(int number, String str);
}
