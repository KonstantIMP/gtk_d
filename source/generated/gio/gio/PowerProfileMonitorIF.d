module gio.PowerProfileMonitorIF;

private import gio.PowerProfileMonitorIF;
private import gio.c.functions;
public  import gio.c.types;
private import gobject.ObjectG;


/**
 * #GPowerProfileMonitor makes it possible for applications as well as OS components
 * to monitor system power profiles and act upon them. It currently only exports
 * whether the system is in “Power Saver” mode (known as “Low Power” mode on
 * some systems).
 * 
 * When in “Low Power” mode, it is recommended that applications:
 * - disabling automatic downloads
 * - reduce the rate of refresh from online sources such as calendar or
 * email synchronisation
 * - if the application has expensive visual effects, reduce them
 * 
 * It is also likely that OS components providing services to applications will
 * lower their own background activity, for the sake of the system.
 * 
 * There are a variety of tools that exist for power consumption analysis, but those
 * usually depend on the OS and hardware used. On Linux, one could use `upower` to
 * monitor the battery discharge rate, `powertop` to check on the background activity
 * or activity at all), `sysprof` to inspect CPU usage, and `intel_gpu_time` to
 * profile GPU usage.
 * 
 * Don't forget to disconnect the #GPowerProfileMonitor::notify::power-saver-enabled
 * signal, and unref the #GPowerProfileMonitor itself when exiting.
 *
 * Since: 2.70
 */
public interface PowerProfileMonitorIF{
	/** Get the main Gtk struct */
	public GPowerProfileMonitor* getPowerProfileMonitorStruct(bool transferOwnership = false);

	/** the main Gtk struct as a void* */
	protected void* getStruct();


	/** */
	public static GType getType()
	{
		return g_power_profile_monitor_get_type();
	}

	/**
	 * Gets a reference to the default #GPowerProfileMonitor for the system.
	 *
	 * Returns: a new reference to the default #GPowerProfileMonitor
	 *
	 * Since: 2.70
	 */
	public static PowerProfileMonitorIF dupDefault()
	{
		auto __p = g_power_profile_monitor_dup_default();

		if(__p is null)
		{
			return null;
		}

		return ObjectG.getDObject!(PowerProfileMonitorIF)(cast(GPowerProfileMonitor*) __p, true);
	}

	/**
	 * Gets whether the system is in “Power Saver” mode.
	 *
	 * You are expected to listen to the
	 * #GPowerProfileMonitor::notify::power-saver-enabled signal to know when the profile has
	 * changed.
	 *
	 * Returns: Whether the system is in “Power Saver” mode.
	 *
	 * Since: 2.70
	 */
	public bool getPowerSaverEnabled();
}
