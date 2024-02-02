package Pegas.view;

import Pegas.model.Animals;
import Pegas.presenter.Observer;
import Pegas.presenter.View;

import java.util.Map;

public class AnimalView implements View {
    private Observer observer;
    public AnimalView(Observer observer) {
        this.observer = observer;
    }
    public void setObserver(Observer observer) {
        this.observer = observer;
    }
    public void showAnimals(Map<Integer, Animals> arr) {
        arr.entrySet().forEach(System.out::println);
    }
    public void addAnimalToRegistry(String name, int age, String commands, String type) {

    }
    public void addNewCommandToAnimal(int number, String str){

    }
}