module SavingsAccount
  def self.interest_rate(balance)
    if balance < 0 then return -3.213
      elsif balance < 1000 then return 0.5
      elsif balance < 5000 then  return 1.621
      else return 2.475
    end           
  end

  def self.annual_balance_update(balance)
    self.interest_rate(balance)*balance.abs/100+balance
  end

  def self.years_before_desired_balance(current_balance, desired_balance)  
    def self.iter(year, balance, desired_balance)
      if balance > desired_balance then return year; end
      self.iter(year + 1, self.annual_balance_update(balance), desired_balance)            
    end
    self.iter(0, current_balance, desired_balance)
  end
end
