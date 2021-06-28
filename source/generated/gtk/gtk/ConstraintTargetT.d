module gtk.ConstraintTargetT;

public  import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkConstraintTarget` interface is implemented by objects that
 * can be used as source or target in `GtkConstraint`s.
 * 
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
 */
public template ConstraintTargetT(TStruct)
{
	/** Get the main Gtk struct */
	public GtkConstraintTarget* getConstraintTargetStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return cast(GtkConstraintTarget*)getStruct();
	}

}
