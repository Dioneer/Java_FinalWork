package Pegas.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Horse extends Animals{
    private static int count = 1000;
    private final int number;
    private String name;
    private int age;
    private List<String> commands= new ArrayList<>();
    public Horse(String name, int age, String str) {
        this.name = name;
        this.age = age;
        this.number = ++count;
        addCommand(str);
    }

    public void addCommand(String str){
        String[] arr= str.trim().split(",");
        commands.addAll(Arrays.asList(arr));
    }
    public int getNumber() {
        return number;
    }
    public String getName() {
        return name;
    }
    public int getAge() {
        return age;
    }
    public List<String> getCommands() {
        return commands;
    }
    @Override
    public String toString() {
        return "Horse{" +
                "number=" + number +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", commands=" + commands +
                '}';
    }
}
