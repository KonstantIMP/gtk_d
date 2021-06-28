module gio.NativeVolumeMonitor;

private import gio.VolumeMonitor;
private import gio.c.functions;
public  import gio.c.types;


/** */
public class NativeVolumeMonitor : VolumeMonitor
{
	/** the main Gtk struct */
	protected GNativeVolumeMonitor* gNativeVolumeMonitor;

	/** Get the main Gtk struct */
	public GNativeVolumeMonitor* getNativeVolumeMonitorStruct(bool transferOwnership = false)
	{
		if (transferOwnership)
			ownedRef = false;
		return gNativeVolumeMonitor;
	}

	/** the main Gtk struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gNativeVolumeMonitor;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GNativeVolumeMonitor* gNativeVolumeMonitor, bool ownedRef = false)
	{
		this.gNativeVolumeMonitor = gNativeVolumeMonitor;
		super(cast(GVolumeMonitor*)gNativeVolumeMonitor, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_native_volume_monitor_get_type();
	}
}
