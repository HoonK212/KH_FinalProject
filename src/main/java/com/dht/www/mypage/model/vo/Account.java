package com.dht.www.mypage.model.vo;

public class Account {
   private String account;
   private String bank; 
   private String id;
   public String getAccount() {
      return account;
   }
   public void setAccount(String account) {
      this.account = account;
   }
   public String getBank() {
      return bank;
   }
   public void setBank(String bank) {
      this.bank = bank;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   @Override
   public String toString() {
      return "Account [account=" + account + ", bank=" + bank + ", id=" + id + "]";
   }
   
   

}