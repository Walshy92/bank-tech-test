describe Account do
  let(:account) { Account.new }
  context 'depositing money' do
    it 'shows the funds in the account' do
      account.deposit(20)
      expect(account.balance).to eq 20
    end
  end

  context 'withdrawing money' do
    it 'throws an error when not enough money to ' do
      expect { account.withdraw(10) }.to raise_error 'Insufficient funds'
    end

    it 'wont allow you to withdraw a negative figure' do
      expect { account.withdraw(-50) }.to raise_error 'Nice try buddy'
    end

    it 'allows withdrawls to be made when funds are available' do
      account.deposit(50)
      account.withdraw(30)
      expect(account.balance).to eq 20
    end
  end

  context 'printing statements' do
    it 'will show the logs of the account' do
      account.deposit(50)
      account.withdraw(30)
      account.statement
      expect { print('Date made || Deposit || Withdrawl || Balance
12/01/2021 || 0.00 || 30.00 || 20.00
12/01/2021 || 50.00 || 0.00 || 50.00') }.to output.to_stdout
    end
  end
end
