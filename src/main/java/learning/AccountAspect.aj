package learning;

public aspect AccountAspect {
    final int MIN_BALANCE = 10;

    pointcut callWithDraw(int amount, Account acc):
            call(boolean Account.withdraw(int)) && args(amount) && target(acc);

    before(int amount, Account acc): callWithDraw(amount, acc) {
        System.out.println("Attempting to withdraw " + amount);
    }

    boolean around(int amount, Account acc):
            callWithDraw(amount, acc) {
        System.out.println("Checking balance");
        if ((acc.balance - amount) < MIN_BALANCE) {
            System.out.println("Insufficient funds");
            return false;
        }
        System.out.println("Withdrawal approved");
        return proceed(amount, acc);
    }

    after(int amount, Account acc): callWithDraw(amount, acc) {
        System.out.println("New balance: " + acc.balance);
    }
}
