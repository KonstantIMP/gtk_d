module gdk.DNDEvent;

private import gdk.Drop;
private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.ObjectG;


/**
 * An event related to drag and drop operations.
 */
public class DNDEvent : Event
{
	/** the main Gtk struct */
	protected GdkDNDEvent* gdkDNDEvent;

	/** Get the main Gtk struct */
	public GdkDNDEvent* getDNDEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkDNDEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkDNDEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkDNDEvent* gdkDNDEvent, bool ownedRef = false)
	{
		this.gdkDNDEvent = gdkDNDEvent;
		super(cast(GdkEvent*)gdkDNDEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_dnd_event_get_type();
	}

	/**
	 * Gets the `GdkDrop` object from a DND event.
	 *
	 * Returns: the drop
	 */
	public Drop getDrop()
	{
		auto __p = gdk_dnd_event_get_drop(cast(GdkEvent*)gdkDNDEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Drop)(cast(GdkDrop*) __p);
	}
}
