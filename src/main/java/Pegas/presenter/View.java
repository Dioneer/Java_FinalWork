package Pegas.presenter;

import Pegas.model.Animals;

import java.util.Map;

public interface View {
    void showAnimals(Map<Integer, Animals> arr);
    void addAnimalToRegistry(String name, int age, String commands, String type);
    void addNewCommandToAnimal(int number, String str);
    void setObserver(Observer observer);
}
