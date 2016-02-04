````objc
 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *act1 = [UIAlertAction actionWithTitle:@"title1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *act2 = [UIAlertAction actionWithTitle:@"title2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *act3 = [UIAlertAction actionWithTitle:@"cannel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *act4 = [UIAlertAction actionWithTitle:@"Destructive" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:act1];
    [alert addAction:act2];
    [alert addAction:act3];
    [alert addAction:act4];
    
    [self presentViewController:alert animated:YES completion:^{
        
    }];
````    