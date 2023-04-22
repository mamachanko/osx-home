return {
  s(":rrsr", fmta([[
  // Apply<name> applies TODO
  func Apply<name>() reconcilers.SubReconciler {
  	return &reconcilers.ChildReconciler{
  		ChildType:     &<type>{},
  		ChildListType: &<type>List{},
  		DesiredChild: func(ctx context.Context, parent *<parent>) (*<type>, error) {
  			return &<type>{
  				ObjectMeta: metav1.ObjectMeta{
  					Name:      // TODO,
  					Namespace: parent.Namespace,
  					Labels: map[string]string{
  						// https://kubernetes.io/docs/concepts/overview/working-with-objects/common-labels/
  						"app.kubernetes.io/part-of":    parent.Name,
  						"app.kubernetes.io/component":  // TODO,
  						"app.kubernetes.io/managed-by": "sso.apps.tanzu.vmware.com",
  						"app.kubernetes.io/created-by": "controller",
  					},
  					Annotations: map[string]string{
  						"sso.apps.tanzu.vmware.com/documentation": // TODO,
  					},
  				},
  				Spec: <type>Spec{},
  			}, nil
  		},
  		MergeBeforeUpdate: func(actual, desired *<type>) {
  			actual.Labels = desired.Labels
  			actual.Spec = desired.Spec
  			for key, value := range desired.Annotations {
  				actual.Annotations[key] = value
  			}
  		},
  		OurChild: func(parent *<parent>, child *<type>) bool {
  			return child.Labels["app.kubernetes.io/component"] == "bootstrap-issuer"
  		},
  	}
  }
  ]], {
      name = i(1),
      parent = i(2),
      type = i(3),
    }, {
      repeat_duplicates = true,
    }
  )),
  s(":rrsy", fmta([[
  // <name> TODO
  func <name>(c reconcilers.Config) reconcilers.SubReconciler {
  	return &reconcilers.SyncReconciler{
  		Sync: func(ctx context.Context, parent *<parent>) error {
  			l := logr.FromContextOrDiscard(ctx).
  				WithValues("parent", client.ObjectKeyFromObject(parent))

        // Resolve stuff
        // Stash stuff
        // Update parent status

  			return nil
  		},
  	}
  }
  ]], {
      name = i(1),
      parent = i(2),
    }, {
      repeat_duplicates = true,
    }
  ))
}
