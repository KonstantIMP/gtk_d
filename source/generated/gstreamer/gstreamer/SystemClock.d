module gstreamer.SystemClock;

private import gobject.ObjectG;
private import gstreamer.Clock;
private import gstreamer.c.functions;
public  import gstreamer.c.types;


/**
 * The GStreamer core provides a GstSystemClock based on the system time.
 * Asynchronous callbacks are scheduled from an internal thread.
 * 
 * Clock implementors are encouraged to subclass this systemclock as it
 * implements the async notification.
 * 
 * Subclasses can however override all of the important methods for sync and
 * async notifications to implement their own callback methods or blocking
 * wait operations.
 */
public class SystemClock : Clock
{
	/** the main Gtk struct */
	protected GstSystemClock* gstSystemClock;

	/** Get the main Gtk struct */
	public GstSystemClock* getSystemClockStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gstSystemClock;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gstSystemClock;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GstSystemClock* gstSystemClock, bool ownedRef = false)
	{
		this.gstSystemClock = gstSystemClock;
		super(cast(GstClock*)gstSystemClock, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return gst_system_clock_get_type();
	}

	/**
	 * Get a handle to the default system clock. The refcount of the
	 * clock will be increased so you need to unref the clock after
	 * usage.
	 *
	 * Returns: the default clock.
	 *
	 *     MT safe.
	 */
	public static Clock obtain()
	{
		auto __p = gst_system_clock_obtain();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(Clock)(cast(GstClock*) __p, true);
	}

	/**
	 * Sets the default system clock that can be obtained with
	 * gst_system_clock_obtain().
	 *
	 * This is mostly used for testing and debugging purposes when you
	 * want to have control over the time reported by the default system
	 * clock.
	 *
	 * MT safe.
	 *
	 * Params:
	 *     newClock = a #GstClock
	 *
	 * Since: 1.4
	 */
	public static void setDefault(Clock newClock)
	{
		gst_system_clock_set_default((newClock is null) ? null : newClock.getClockStruct());
	}
}
