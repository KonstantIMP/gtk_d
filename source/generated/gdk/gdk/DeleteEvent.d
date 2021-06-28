module gdk.DeleteEvent;

private import gdk.Event;
private import gdk.c.functions;
public  import gdk.c.types;


/**
 * An event related to closing a top-level surface.
 */
public class DeleteEvent : Event
{
	/** the main Gtk struct */
	protected GdkDeleteEvent* gdkDeleteEvent;

	/** Get the main Gtk struct */
	public GdkDeleteEvent* getDeleteEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkDeleteEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkDeleteEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkDeleteEvent* gdkDeleteEvent, bool ownedRef = false)
	{
		this.gdkDeleteEvent = gdkDeleteEvent;
		super(cast(GdkEvent*)gdkDeleteEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_delete_event_get_type();
	}
}
