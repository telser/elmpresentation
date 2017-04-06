import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  template: '<ng-elm [src]="Todo"></ng-elm>',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
    title = 'Some ng thing';
    public Todo: any;

    ngOnInit() {
        this.Todo = require('app/elm.js').Todo;
    }
}
