module gdk.GrabBrokenEvent;

private import gdk.Event;
private import gdk.Surface;
private import gdk.c.functions;
public  import gdk.c.types;
private import gobject.ObjectG;


/**
 * An event related to a broken windowing system grab.
 */
public class GrabBrokenEvent : Event
{
	/** the main Gtk struct */
	protected GdkGrabBrokenEvent* gdkGrabBrokenEvent;

	/** Get the main Gtk struct */
	public GdkGrabBrokenEvent* getGrabBrokenEventStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gdkGrabBrokenEvent;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gdkGrabBrokenEvent;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GdkGrabBrokenEvent* gdkGrabBrokenEvent, bool ownedRef = false)
	{
		this.gdkGrabBrokenEvent = gdkGrabBrokenEvent;
		super(cast(GdkEvent*)gdkGrabBrokenEvent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gdk_grab_broken_event_get_type();
	}

	/**
	 * Extracts the grab surface from a grab broken event.
	 *
	 * Returns: the grab surface of @event
	 */
	public Surface getGrabSurface()
	{
		auto __p = gdk_grab_broken_event_get_grab_surface(cast(GdkEvent*)gdkGrabBrokenEvent);

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Surface)(cast(GdkSurface*) __p);
	}

	/**
	 * Checks whether the grab broken event is for an implicit grab.
	 *
	 * Returns: %TRUE if the an implicit grab was broken
	 */
	public bool getImplicit()
	{
		return gdk_grab_broken_event_get_implicit(cast(GdkEvent*)gdkGrabBrokenEvent) != 0;
	}
}
