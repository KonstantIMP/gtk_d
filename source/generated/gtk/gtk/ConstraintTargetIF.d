module gtk.ConstraintTargetIF;

private import gtk.c.functions;
public  import gtk.c.types;


/**
 * The `GtkConstraintTarget` interface is implemented by objects that
 * can be used as source or target in `GtkConstraint`s.
 * 
 * Besides `GtkWidget`, it is also implemented by `GtkConstraintGuide`.
 */
public interface ConstraintTargetIF{
	/** Get the main Gtk struct */
	public GtkConstraintTarget* getConstraintTargetStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_constraint_target_get_type();
	}
}
