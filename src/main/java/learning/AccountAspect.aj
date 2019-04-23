package learning;

public aspect AccountAspect {
    final int MIN_BALANCE = 10;

    pointcut callWithDraw(int amount, Account acc) :
            call(boolean Account.withdraw(int)) && args(amount) && target(acc);

    before(int amount, Account acc): callWithDraw(amount, acc) {
    }

    boolean around(int amount, Account acc) :
            callWithDraw(amount, acc) {
        System.out.println("Checking balance");
        if (acc.balance < amount) {
            System.out.println("Insufficient funds");
            return false;
        }
        System.out.println("Withdrawal approved");
        return proceed(amount, acc);
    }

    after(int amount, Account balance) : callWithDraw(amount, balance) {
    }
}
