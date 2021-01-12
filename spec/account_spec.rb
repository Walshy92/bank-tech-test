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
  end
end
