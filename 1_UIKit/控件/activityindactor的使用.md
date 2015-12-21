```` objc

    if([self.activityIndiactor isAnimating]){
        [self.activityIndiactor stopAnimating];
    }else{
        [self.activityIndiactor startAnimating];

    }
    self.activityIndiactor.hidesWhenStopped = true;
````

