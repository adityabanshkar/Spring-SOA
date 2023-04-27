import { LightningElement,track,wire } from 'lwc';
import getAccount from '@salesforce/apex/displayAccountClass.getAccount';

export default class DisplayAccount extends LightningElement {
    @track columns = [
          { label: 'Name', fieldName: 'Name' },
          { label: 'Id', fieldName: 'Id'},
          { label: 'Created Date', fieldName: 'CreatedDate'}
      ];
    @track accList

    @wire(getAccount) wireAccount({data,error}){
        if(data){
            this.accList=data
            console.log('DAta:'+data)
        }
        else{
            console.log('Error@:'+error)
        }
    }
}