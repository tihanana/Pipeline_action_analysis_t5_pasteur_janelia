function trx = give_give_state_specific_for_cluster(trx,name_classifier_state_loc)



switch lower(name_classifier_state_loc)
    
    case 'compressing'
        
        trx = give_state_specific_choreography_compressing(trx);
        
    case 'expanding'
              
        trx = give_state_specific_choreography_expanding(trx);
        
    case 'nematicking'
        
        trx = give_state_specific_choreography_nematicking(trx);
        
    case 'denematicking'
    
        trx = give_state_specific_choreography_denematicking(trx);
        
end


end