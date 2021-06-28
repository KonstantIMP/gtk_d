module gtk.BuildableIF;

private import glib.Str;
private import glib.c.functions;
private import gtk.c.functions;
public  import gtk.c.types;


/**
 * `GtkBuildable` allows objects to extend and customize their deserialization
 * from ui files.
 * 
 * The interface includes methods for setting names and properties of objects,
 * parsing custom tags and constructing child objects.
 * 
 * The `GtkBuildable` interface is implemented by all widgets and
 * many of the non-widget objects that are provided by GTK. The
 * main user of this interface is [class@Gtk.Builder]. There should be
 * very little need for applications to call any of these functions directly.
 * 
 * An object only needs to implement this interface if it needs to extend the
 * `GtkBuilder` XML format or run any extra routines at deserialization time.
 */
public interface BuildableIF{
	/** Get the main Gtk struct */
	public GtkBuildable* getBuildableStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return gtk_buildable_get_type();
	}

	/**
	 * Gets the ID of the @buildable object.
	 *
	 * `GtkBuilder` sets the name based on the ID attribute
	 * of the <object> tag used to construct the @buildable.
	 *
	 * Returns: the ID of the buildable object
	 */
	public string getBuildableId();
}
