package learning;


public class Account {
    int balance = 20;

    public boolean withdraw(int amount) {
        balance = balance - amount;
        return true;
    }
}
