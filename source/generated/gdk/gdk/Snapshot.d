module gdk.Snapshot;

private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.ObjectG;


/**
 * Base type for snapshot operations.
 * 
 * The subclass of `GdkSnapshot` used by GTK is [class@Gtk.Snapshot].
 */
public class Snapshot : ObjectG
{
	/** the main Gtk struct */
	protected GdkSnapshot* gdkSnapshot;

	/** Get the main Gtk struct */
	public GdkSnapshot* getSnapshotStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkSnapshot;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkSnapshot;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkSnapshot* gdkSnapshot, bool ownedRef = false)
	{
		this.gdkSnapshot = gdkSnapshot;
		super(cast(GObject*)gdkSnapshot, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_snapshot_get_type();
	}
}
