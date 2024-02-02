package Pegas.model;

public abstract class Animals {
    private static int counter;
    private final int id;

    {
        id=++counter;
    }
    public int getId() {
        return id;
    }
}
